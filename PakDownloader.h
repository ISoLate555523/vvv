// Copyright (C) 2019-2022 Blue Mountains GmbH. All Rights Reserved.

#pragma once

#include "CoreMinimal.h"
#include "Kismet/BlueprintAsyncActionBase.h"
#include "Interfaces/IHttpRequest.h"
#include "Interfaces/IHttpResponse.h"
#include "Runtime/Launch/Resources/Version.h"
#include "PakDownloader.generated.h"

DECLARE_DYNAMIC_MULTICAST_DELEGATE_FourParams(FDownloadPakDelegate, int32, HttpResponseCode, int32, ContentLength, const FString, SavePath, int32, BytesReceived);

UCLASS()
class UAsyncPakDownloader : public UBlueprintAsyncActionBase
{
	GENERATED_UCLASS_BODY()

public:
	UFUNCTION(BlueprintCallable, Category = "Download", meta = (BlueprintInternalUseOnly = "true"))
	static UAsyncPakDownloader *Download(const FString &URL, const FString &SavePath);

	UPROPERTY(BlueprintAssignable)
	FDownloadPakDelegate OnSuccess;

	UPROPERTY(BlueprintAssignable)
	FDownloadPakDelegate OnFail;

	UPROPERTY(BlueprintAssignable)
	FDownloadPakDelegate OnProgress;

protected:
	void StartDownload(const FString &URL, const FString &SavePath);

private:
	void HandleDownloadComplete(FHttpRequestPtr HttpRequest, FHttpResponsePtr HttpResponse, bool bSucceeded);
	void HandleDownloadProgress(FHttpRequestPtr InRequest, uint64 bytesSent, uint64 bytesReceived);

	FString SaveFilePath;
};
