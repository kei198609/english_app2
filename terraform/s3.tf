####################################################
# S3
####################################################
resource "aws_s3_bucket" "bucket_name" {
  bucket = "mailmentorbucket"
}

data "aws_canonical_user_id" "current" {}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket_name.id

  access_control_policy {
    owner {
      id = data.aws_canonical_user_id.current.id
    }

    grant {
      permission = "FULL_CONTROL"
      grantee {
        id   = data.aws_canonical_user_id.current.id
        type = "CanonicalUser"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access_block" {
  bucket = aws_s3_bucket.bucket_name.id

  block_public_acls       = true # パブリックACLのブロックを有効化
  block_public_policy     = true # パブリックポリシーのブロックを有効化
  ignore_public_acls      = true # パブリックACLの無視を有効化
  restrict_public_buckets = true # パブリックバケットのアクセス制限を有効化
}