allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

// Some older Flutter plugins ship Android Gradle scripts without `namespace`.
// AGP 8+ requires it, so we inject one for the affected plugin module.
subprojects {
    if (name == "isar_flutter_libs") {
        pluginManager.withPlugin("com.android.library") {
            val androidExt = extensions.findByName("android") ?: return@withPlugin
            // Inject namespace immediately when plugin is applied
            val setNamespace = androidExt.javaClass.methods
                .firstOrNull { it.name == "setNamespace" && it.parameterTypes.size == 1 }
            setNamespace?.invoke(androidExt, "dev.isar.isar_flutter_libs")
        }

        // Force compileSdk after evaluation to override what the plugin sets
        afterEvaluate {
            val androidExt = extensions.findByName("android") ?: return@afterEvaluate
            val setCompileSdk = androidExt.javaClass.methods
                .firstOrNull { it.name == "setCompileSdk" && it.parameterTypes.size == 1 }
                ?: androidExt.javaClass.methods
                .firstOrNull { it.name == "setCompileSdkVersion" && it.parameterTypes.size == 1 }
            
            setCompileSdk?.invoke(androidExt, 35)
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
