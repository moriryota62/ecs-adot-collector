# Terraform

テスト用のVPCおよびECSクラスタを作成するコード群です。タスクメトリクスとインスタンスメトリクスを収集するサンプルサービスを作成するコード群もあります。

## 使い方

- versions.tfのregionやdefault_tags等を修正します
- main.tf内のパラメーターを任意の値に修正します
- 以下コマンドでデプロイします
``` sh
terraform init
terraform plan
terraform apply
```