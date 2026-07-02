// Fill out your copyright notice in the Description page of Project Settings.


#include "MyBlueprintFunctionLibrary.h"
#include "Misc/FileHelper.h"
#include "Misc/Paths.h"


//头文件是调用文件管理
FString UMyBlueprintFunctionLibrary::ReadText(FString RelativeFilePath)//读取
{
	FString ResultString;
	FString FilePath = FPaths::ProjectDir() + RelativeFilePath; //获取文件路径
	FFileHelper::LoadFileToString(ResultString, *FilePath); //读取文件内容到ResultString
	return ResultString;
}

bool UMyBlueprintFunctionLibrary::WriteText(FString RelativeFilePath, FString Content)//写入
{
	FString FilePath = FPaths::ProjectDir() + RelativeFilePath; //获取文件路径
	bool Result = FFileHelper::SaveStringToFile(Content, *FilePath); //将Content写入文件
	return Result;
}
