package Cx

CxPolicy[result] {
	resource := input.document[i].resource.aws_elasticache_replication_group[name]

	object.get(resource, "at_rest_encryption_enabled", "undefined") == "undefined"

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("aws_elasticache_replication_group[%s]", [name]),
		"issueType": "MissingAttribute",
		"keyExpectedValue": "The attribute 'at_rest_encryption_enabled' is set to true",
		"keyActualValue": "The attribute 'at_rest_encryption_enabled' is undefined",
	}
}

CxPolicy[result] {
	resource := input.document[i].resource.aws_elasticache_replication_group[name]

	resource.at_rest_encryption_enabled != true

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("aws_elasticache_replication_group[%s].at_rest_encryption_enabled", [name]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": "The attribute 'at_rest_encryption_enabled' is set to true",
		"keyActualValue": "The attribute 'at_rest_encryption_enabled' is not set to true",
	}
}
