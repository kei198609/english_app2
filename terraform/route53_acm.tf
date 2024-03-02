####################################################
# Route 53
####################################################
# front
resource "aws_route53_zone" "front_domain" {
  name = local.app_domain_name
  comment = "HostedZone created by Route53 Registrar"
}

resource "aws_route53_record" "a" {
  zone_id = aws_route53_zone.front_domain.zone_id
  name    = "mailmentor.link"
  type    = "A"

  alias {
    name                   = var.a_alias_name
    zone_id                = var.a_alias_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "ns" {
  zone_id = aws_route53_zone.front_domain.zone_id
  name    = "mailmentor.link"
  type    = "NS"
  ttl     = 172800
  records = [
    "${aws_route53_zone.front_domain.name_servers[0]}.",
    "${aws_route53_zone.front_domain.name_servers[1]}.",
    "${aws_route53_zone.front_domain.name_servers[2]}.",
    "${aws_route53_zone.front_domain.name_servers[3]}.",
  ]
}

resource "aws_route53_record" "soa" {
  zone_id = aws_route53_zone.front_domain.zone_id
  name    = "mailmentor.link"
  type    = "SOA"
  ttl     = 900
  records = [var.soa_record]
}

resource "aws_route53_record" "cname" {
  zone_id = aws_route53_zone.front_domain.zone_id
  name    = var.cname_name
  type    = "CNAME"
  ttl     = 300
  records = [var.cname_record]
}


# api
resource "aws_route53_zone" "api_domain" {
  name = local.api_domain_name
  comment = "HostedZone created by Route53 Registrar"
}

resource "aws_route53_record" "api_a" {
  zone_id = aws_route53_zone.api_domain.zone_id
  name    = "api-mailmentor.link"
  type    = "A"

  alias {
    name                   = var.api_a_alias_name
    zone_id                = var.api_a_alias_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "api_ns" {
  zone_id = aws_route53_zone.api_domain.zone_id
  name    = "api-mailmentor.link"
  type    = "NS"
  ttl     = 172800
  records = [
    "${aws_route53_zone.api_domain.name_servers[0]}.",
    "${aws_route53_zone.api_domain.name_servers[1]}.",
    "${aws_route53_zone.api_domain.name_servers[2]}.",
    "${aws_route53_zone.api_domain.name_servers[3]}.",
  ]
}

resource "aws_route53_record" "api_soa" {
  zone_id = aws_route53_zone.api_domain.zone_id
  name    = "api-mailmentor.link"
  type    = "SOA"
  ttl     = 900
  records = [var.api_soa_record]
}

resource "aws_route53_record" "api_cname" {
  zone_id = aws_route53_zone.api_domain.zone_id
  name    = var.api_cname_name
  type    = "CNAME"
  ttl     = 300
  records = [var.api_cname_record]
}

####################################################
# ACM
####################################################
resource "aws_acm_certificate" "front_domain_acm" {
  domain_name               = local.app_domain_name
  validation_method         = "DNS"
  subject_alternative_names = ["*.${local.app_domain_name}", local.app_domain_name]
  options {
    certificate_transparency_logging_preference = "ENABLED"
  }
}

resource "aws_acm_certificate" "api_domain_acm" {
  domain_name               = local.api_domain_name
  validation_method         = "DNS"
  subject_alternative_names = ["*.${local.api_domain_name}", local.api_domain_name]
  options {
    certificate_transparency_logging_preference = "ENABLED"
  }
}