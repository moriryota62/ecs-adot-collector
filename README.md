# ecs-adot-collector

[Container Insights](https://docs.aws.amazon.com/ja_jp/AmazonCloudWatch/latest/monitoring/ContainerInsights.html)はECSやEKSの環境で手っ取り早くメトリクスをモニタリングするのに役立ちます。しかし、標準のContainer Insightsでモニタリングするメトリクスは数が多く、費用が高くなりがちです。また、収集するメトリクスの調整もできません。

[AWS Distro for OpenTelemetory](https://aws-otel.github.io/)(通称ADOT)はAWSが開発したOpenTelemetoryのディストリビューションです。OpenTelemetoryはCNCFのプロジェクトの一つです。製品に依存しないテレメトリ(メトリクス、トレース、ログ)の収集と送信を行うための規格およびツールの作成をしています。ADOTコレクターを使うことで任意のメトリクスを収集できます。

以下のものを公開しています。

**ADOTコレクター コンテナイメージ**: ADOTコレクターのコンテナイメージはこちらの[amazon/aws-otel-collector](https://hub.docker.com/r/amazon/aws-otel-collector)で提供されています。ADOTコレクターで収集するメトリクスは起動時に指定するコンフィグファイルで指定します。イメージ内にはあらかじめいくつかのテンプレートが用意されています。テンプレートの内容はGitHubの[aws-observability/aws-otel-collector](https://github.com/aws-observability/aws-otel-collector/tree/main/config/ecs)で確認できます。任意のメトリクスを収集する場合、自身でコンフィグファイルを作成します。本リポジトリではECSタスクのCPUとメモリの予約量/使用量を取得するコンフィグファイル(custom-config.yaml)を含むコンテナイメージの資材を公開しています。

**Terraform**: テスト用のVPCおよびECSクラスタを作成するコード群です。また、タスクメトリクスとインスタンスメトリクスを収集するサンプルサービスを作成するコード群もあります。
