# ADOTコレクターコンテナイメージ

ADOTコレクターのコンテナイメージをビルドする資材を配置しています。custom-config.yamlはECSタスクのCPUとメモリの予約量と使用量のメトリクスを取得する設定を記述しています。他のメトリクスを収集したい場合は任意に書き換えてください。ADOTで収集できるタスクのメトリクスはこちらの[Getting started using AWS ECS container metrics receiver in AWS OpenTelemetry Collector](https://aws-otel.github.io/docs/components/ecs-metrics-receiver)にあります。またはADOTコレクターのテンプレートを[aws-observability/aws-otel-collector](https://github.com/aws-observability/aws-otel-collector/tree/main/config/ecs)で参考にするのもいいです。

## ビルド方法

- custom-config.yamlを修正
- 以下コマンドでビルド&プッシュ
``` sh
docker build -t <YOUR REPOSITORY>:<TAG> .
docker push <YOUR REPOSITORY>:<TAG>
```
