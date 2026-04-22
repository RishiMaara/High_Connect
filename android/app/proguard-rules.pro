# ─────────────────────────────────────────────────────────────
# Suppress generated warnings
# ─────────────────────────────────────────────────────────────
-dontwarn com.google.errorprone.annotations.CanIgnoreReturnValue
-dontwarn com.google.errorprone.annotations.CheckReturnValue
-dontwarn com.google.errorprone.annotations.Immutable
-dontwarn com.google.errorprone.annotations.RestrictedApi
-dontwarn javax.annotation.Nullable
-dontwarn javax.annotation.concurrent.GuardedBy
-dontwarn org.bouncycastle.jce.provider.BouncyCastleProvider
-dontwarn org.bouncycastle.pqc.jcajce.provider.BouncyCastlePQCProvider
-dontwarn io.flutter.embedding.android.FlutterPlayStoreSplitApplication
-dontwarn io.flutter.embedding.engine.deferredcomponents.**
-keep class org.xmlpull.v1.** { *; }

# ─────────────────────────────────────────────────────────────
# Keep all attributes required by Firebase / Firestore
# ─────────────────────────────────────────────────────────────
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes EnclosingMethod
-keepattributes InnerClasses

# ─────────────────────────────────────────────────────────────
# Firebase (ALL modules — prevents crashes in release APK)
# ─────────────────────────────────────────────────────────────
-keep class com.google.firebase.** { *; }
-keep interface com.google.firebase.** { *; }

# Firebase Auth (Phone OTP, Google, Email)
-keep class com.google.firebase.auth.** { *; }
-keep class com.google.firebase.auth.internal.** { *; }

# Firebase Firestore (document serialisation)
-keep class com.google.firebase.firestore.** { *; }
-keepclassmembers class ** {
    @com.google.firebase.firestore.PropertyName <fields>;
    @com.google.firebase.firestore.PropertyName <methods>;
}

# Firebase Storage
-keep class com.google.firebase.storage.** { *; }

# Firebase Messaging / FCM
-keep class com.google.firebase.messaging.** { *; }
-keep class com.google.firebase.iid.** { *; }

# Firebase Crashlytics
-keep class com.google.firebase.crashlytics.** { *; }
-keep class com.crashlytics.** { *; }
-dontwarn com.crashlytics.**

# ─────────────────────────────────────────────────────────────
# Google Play Services (required for Google Sign‑In & Phone auth)
# ─────────────────────────────────────────────────────────────
-keep class com.google.android.gms.** { *; }
-keep interface com.google.android.gms.** { *; }
-keep class com.google.android.gms.auth.** { *; }
-keep class com.google.android.gms.common.** { *; }
-keep class com.google.android.gms.tasks.** { *; }

# SafetyNet (used for Phone Number verification on Android)
-keep class com.google.android.gms.safetynet.** { *; }

# Google Maps
-keep class com.google.android.gms.maps.** { *; }
-keep interface com.google.android.gms.maps.** { *; }

# Google Sign‑In
-keep class com.google.android.gms.auth.api.signin.** { *; }
-keep class com.google.android.gms.auth.api.identity.** { *; }

# ─────────────────────────────────────────────────────────────
# Flutter embedding
# ─────────────────────────────────────────────────────────────
-keep class io.flutter.** { *; }
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.embedding.engine.** { *; }

# ─────────────────────────────────────────────────────────────
# Kotlin coroutines (used by Firebase SDKs internally)
# ─────────────────────────────────────────────────────────────
-keepnames class kotlinx.coroutines.** { *; }
-keepclassmembernames class kotlinx.coroutines.** { *; }
-dontwarn kotlinx.coroutines.**

# ─────────────────────────────────────────────────────────────
# Gson (used by Firestore SDK)
# ─────────────────────────────────────────────────────────────
-keep class com.google.gson.** { *; }
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer
-keepclassmembers,allowobfuscation class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

# ─────────────────────────────────────────────────────────────
# OkHttp / Okio (network layer)
# ─────────────────────────────────────────────────────────────
-dontwarn okhttp3.**
-dontwarn okio.**
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-keep class okio.** { *; }

# ─────────────────────────────────────────────────────────────
# Glide / Coil / Picasso (image loading — cached_network_image)
# ─────────────────────────────────────────────────────────────
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep class * extends com.bumptech.glide.module.AppGlideModule { <init>(...); }
-keep public enum com.bumptech.glide.load.ImageHeaderParser$** {
    **[] $VALUES;
    public *;
}
-dontwarn com.bumptech.glide.**

# ─────────────────────────────────────────────────────────────
# Play Core
# ─────────────────────────────────────────────────────────────
-dontwarn com.google.android.play.core.**
-keep class com.google.android.play.core.** { *; }

# ─────────────────────────────────────────────────────────────
# Prevent stripping data model / POJO classes used by Firestore
# ─────────────────────────────────────────────────────────────
-keepclassmembers class * {
    public <init>();
}
-keepclassmembers class ** {
    public ** get*();
    public void set*(***);
}
