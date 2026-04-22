/**
 * Script to update Firestore categories collection with Civil Engineering categories
 * Run: npx firebase-tools firestore:delete --all-collections --force && node update_categories.js
 * Or: set GOOGLE_APPLICATION_CREDENTIALS and run node update_categories.js
 */

const admin = require('firebase-admin');

// Set environment variable to use Firebase emulator/use default credentials
process.env.FIRESTORE_EMULATOR_HOST = '';
process.env.GOOGLE_CLOUD_PROJECT = 'high-connect-3';

// Initialize without credentials - will use ADC or fail gracefully
let initialized = false;
try {
    admin.initializeApp({
        projectId: 'high-connect-3',
        credential: admin.credential.applicationDefault()
    });
    initialized = true;
} catch (e) {
    console.log('Trying without explicit credentials...');
    try {
        admin.initializeApp({
            projectId: 'high-connect-3'
        });
        initialized = true;
    } catch (e2) {
        console.error('Failed to initialize Firebase Admin:', e2.message);
    }
}

if (!initialized) {
    console.log('\n❌ Could not authenticate with Firebase.');
    console.log('\nTo fix this, you have two options:\n');
    console.log('OPTION 1: Use Firebase Console directly');
    console.log('  1. Go to: https://console.firebase.google.com/project/high-connect-3/firestore');
    console.log('  2. Navigate to the "categories" collection');
    console.log('  3. Delete existing documents');
    console.log('  4. Add the 8 new categories manually\n');
    console.log('OPTION 2: Download a service account key');
    console.log('  1. Go to: https://console.firebase.google.com/project/high-connect-3/settings/serviceaccounts/adminsdk');
    console.log('  2. Click "Generate new private key"');
    console.log('  3. Save as "serviceAccountKey.json" in this folder');
    console.log('  4. Run: set GOOGLE_APPLICATION_CREDENTIALS=serviceAccountKey.json && node update_categories.js');
    process.exit(1);
}

const db = admin.firestore();

const civilEngineeringCategories = [
    {
        category: 'Structural Engineering',
        image: 'https://firebasestorage.googleapis.com/v0/b/high-connect-3.firebasestorage.app/o/categories%2Fstructural.png?alt=media',
        item: 1,
        offerings: ['Structural Analysis', 'Building Design', 'Foundation Design', 'Steel Structures', 'Concrete Structures']
    },
    {
        category: 'Construction Management',
        image: 'https://firebasestorage.googleapis.com/v0/b/high-connect-3.firebasestorage.app/o/categories%2Fconstruction.png?alt=media',
        item: 2,
        offerings: ['Project Management', 'Site Supervision', 'Cost Estimation', 'Quality Control', 'Schedule Management']
    },
    {
        category: 'Building Services (MEP)',
        image: 'https://firebasestorage.googleapis.com/v0/b/high-connect-3.firebasestorage.app/o/categories%2Fmep.png?alt=media',
        item: 3,
        offerings: ['Mechanical Systems', 'Electrical Systems', 'Plumbing', 'Energy Efficiency', 'Building Automation']
    },
    {
        category: 'Geotechnical Engineering',
        image: 'https://firebasestorage.googleapis.com/v0/b/high-connect-3.firebasestorage.app/o/categories%2Fgeotechnical.png?alt=media',
        item: 4,
        offerings: ['Soil Testing', 'Foundation Engineering', 'Slope Stability', 'Ground Improvement', 'Retaining Walls']
    },
    {
        category: 'Transportation & Roads',
        image: 'https://firebasestorage.googleapis.com/v0/b/high-connect-3.firebasestorage.app/o/categories%2Ftransportation.png?alt=media',
        item: 5,
        offerings: ['Highway Design', 'Traffic Engineering', 'Pavement Design', 'Bridge Design', 'Railway Engineering']
    },
    {
        category: 'Water & Environmental Engineering',
        image: 'https://firebasestorage.googleapis.com/v0/b/high-connect-3.firebasestorage.app/o/categories%2Fwater.png?alt=media',
        item: 6,
        offerings: ['Water Supply', 'Wastewater Treatment', 'Stormwater Management', 'Environmental Impact', 'Flood Control']
    },
    {
        category: 'HVAC & Fire Protection',
        image: 'https://firebasestorage.googleapis.com/v0/b/high-connect-3.firebasestorage.app/o/categories%2Fhvac.png?alt=media',
        item: 7,
        offerings: ['HVAC Design', 'Fire Sprinkler Systems', 'Smoke Control', 'Ventilation', 'Fire Alarm Systems']
    },
    {
        category: 'Surveying & Quantity Estimation',
        image: 'https://firebasestorage.googleapis.com/v0/b/high-connect-3.firebasestorage.app/o/categories%2Fsurveying.png?alt=media',
        item: 8,
        offerings: ['Land Surveying', 'Quantity Takeoff', 'Bill of Quantities', 'Topographic Survey', 'GPS Surveying']
    }
];

async function updateCategories() {
    console.log('Starting Firestore categories update...');

    const categoriesRef = db.collection('categories');

    // First, delete all existing categories
    console.log('Deleting existing categories...');
    const existingDocs = await categoriesRef.get();
    const deletePromises = existingDocs.docs.map(doc => doc.ref.delete());
    await Promise.all(deletePromises);
    console.log(`Deleted ${existingDocs.size} existing categories.`);

    // Add new categories
    console.log('Adding new Civil Engineering categories...');
    const addPromises = civilEngineeringCategories.map(category =>
        categoriesRef.add(category)
    );
    await Promise.all(addPromises);

    console.log(`Successfully added ${civilEngineeringCategories.length} new categories!`);
    console.log('Categories updated:');
    civilEngineeringCategories.forEach((cat, i) => {
        console.log(`  ${i + 1}. ${cat.category}`);
    });
}

updateCategories()
    .then(() => {
        console.log('\n✅ Firestore update complete!');
        process.exit(0);
    })
    .catch(error => {
        console.error('❌ Error updating categories:', error);
        process.exit(1);
    });
