using System;

namespace Celeste.Mod.StunningHelper;

public class StunningHelperModule : EverestModule {
    public static StunningHelperModule Instance { get; private set; }

    public override Type SettingsType => typeof(StunningHelperModuleSettings);
    public static StunningHelperModuleSettings Settings => (StunningHelperModuleSettings) Instance._Settings;

    public override Type SessionType => typeof(StunningHelperModuleSession);
    public static StunningHelperModuleSession Session => (StunningHelperModuleSession) Instance._Session;

    public override Type SaveDataType => typeof(StunningHelperModuleSaveData);
    public static StunningHelperModuleSaveData SaveData => (StunningHelperModuleSaveData) Instance._SaveData;

    public StunningHelperModule() {
        Instance = this;
#if DEBUG
        // debug builds use verbose logging
        Logger.SetLogLevel(nameof(StunningHelperModule), LogLevel.Verbose);
#else
        // release builds use info logging to reduce spam in log files
        Logger.SetLogLevel(nameof(StunningHelperModule), LogLevel.Info);
#endif
    }

    public override void Load() {
        // TODO: apply any hooks that should always be active
    }

    public override void Unload() {
        // TODO: unapply any hooks applied in Load()
    }
}