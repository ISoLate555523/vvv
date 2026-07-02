// Copyright Epic Games, Inc. All Rights Reserved.

using UnrealBuildTool;
using System.Collections.Generic;

public class ARPG_CPP_CSEditorTarget : TargetRules
{
	public ARPG_CPP_CSEditorTarget(TargetInfo Target) : base(Target)
	{
		Type = TargetType.Editor;
        DefaultBuildSettings = BuildSettingsVersion.V6;
        IncludeOrderVersion = EngineIncludeOrderVersion.Unreal5_7; 
        ExtraModuleNames.Add("ARPG_CPP_CS");
	}
}
