# sample-instance-metrics

以下のECSサービスをデプロイします。タスク定義のメインコンテナはADOTコレクターを指定しています。ADOTコレクターは標準で用意されているテンプレート(otel-instance-metrics-config.yaml)を指定して起動します。

これらのリソースはADOTのドキュメント[Setup the ADOT Collector for ECS EC2 instance Metrics](https://aws-otel.github.io/docs/setup/ecs#3-setup-the-adot-collector-for-ecs-ec2-instance-metrics)を参考にしています。

- サービス
- タスク定義
- IAMロール、ポリシー
- CloudWatchロググループ

