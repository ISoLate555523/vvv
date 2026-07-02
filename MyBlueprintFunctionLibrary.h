// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Kismet/BlueprintFunctionLibrary.h"
#include "MyBlueprintFunctionLibrary.generated.h"

/**
 * 
 */
UCLASS()
class ARPG_CPP_CS_API UMyBlueprintFunctionLibrary : public UBlueprintFunctionLibrary
{
	GENERATED_BODY()
	
public:
	UFUNCTION(BlueprintCallable, Category = "File")
	static FString ReadText(FString RelativeFilePath);//读取函数，参数为相对路径，返回值为读取到的文本内容
	
	UFUNCTION(BlueprintCallable, Category = "File")
	static bool WriteText(FString RelativeFilePath, FString Content);//写入函数，参数为相对路径和要写入的文本内容，返回值为是否写入成功
};                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
