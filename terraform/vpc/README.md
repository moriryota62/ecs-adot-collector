# VPC

以下のネットワーク環境をデプロイします。サブネットの冗長数はterraform.tfvarsのsubnet_public_cidrsおよびsubnet_private_cidrsで指定する数だけ作成します。

- VPC
- サブネット (&各サブネットのルートテーブル)
    - パブリック
    - プライベート
- インターネットゲートウェイ
- NATゲートウェイ (&EIP)
