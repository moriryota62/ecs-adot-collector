# sample-task-metrics

以下のECSサービスをデプロイします。タスク定義のメインコンテナはNginx、サイドカーコンテナでADOTコレクター([ryotamori/aws-otel-collector](https://hub.docker.com/repository/docker/ryotamori/aws-otel-collector))を指定しています。サイドカーコンテナのADOTコレクターは作成したカスタムコンフィグを指定して起動します。

これらのリソースはADOTのドキュメント[Setup the ADOT Collector for Xray, StatsD and ECS Container metrics](https://aws-otel.github.io/docs/setup/ecs#2-setup-the-adot-collector-for-xray-statsd-and-ecs-container-metrics)を参考にしています。

- サービス
- タスク定義
- IAMロール、ポリシー
- CloudWatchロググループ
