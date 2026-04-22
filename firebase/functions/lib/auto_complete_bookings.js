const { onSchedule } = require("firebase-functions/v2/scheduler");
const admin = require("firebase-admin");

/**
 * Scheduled function that automatically marks bookings as completed
 * when their end time has passed.
 * Runs every hour.
 */
exports.autoCompleteBookings = onSchedule("every 1 hours", async (event) => {
    const firestore = admin.firestore();
    const now = admin.firestore.Timestamp.now();

    try {
        console.log("Starting automatic booking completion check...");

        // Query all bookings that are not completed and not cancelled/rejected
        const bookingsSnapshot = await firestore
            .collectionGroup("my_bookings")
            .where("completed", "==", false)
            .where("status", "not-in", ["rejected", "cancelled"])
            .get();

        console.log(`Found ${bookingsSnapshot.size} active bookings to check`);

        const batch = firestore.batch();
        let completedCount = 0;

        bookingsSnapshot.forEach((doc) => {
            const booking = doc.data();

            // Calculate end time: start_time + (working_hours * 60 minutes)
            if (booking.start_time && booking.working_hours) {
                const startTime = booking.start_time.toDate();
                const workingHoursMs = booking.working_hours * 60 * 60 * 1000; // Convert hours to milliseconds
                const endTime = new Date(startTime.getTime() + workingHoursMs);

                // Check if current time is past the end time
                if (now.toDate() > endTime) {
                    console.log(`Marking booking ${doc.id} as completed (ended at ${endTime})`);
                    batch.update(doc.ref, { completed: true });
                    completedCount++;
                }
            }
        });

        if (completedCount > 0) {
            await batch.commit();
            console.log(`Successfully marked ${completedCount} bookings as completed`);
        } else {
            console.log("No bookings needed to be completed");
        }

        return { success: true, completedCount };
    } catch (error) {
        console.error("Error in autoCompleteBookings:", error);
        throw error;
    }
});
