import boto3
import os


def handler(event, context):
    tag = os.environ.get("TAG")
    opt_in = os.environ.get("OPT_IN")
    opt_out = os.environ.get('OPT_OUT')
    tag_value = event['detail']['tags'][tag]
    filter_name = os.environ.get("FILTER_NAME")
    filter_pattern = ""  # leave blank to capture all
    destination_arn = os.environ.get("DESTINATION_ARN")
    role_arn = os.environ.get("ROLE_ARN")
    source = event['source']
    detail_type = event['detail-type']

    print(f"destination={destination_arn}")

    if source == 'aws.tag' and detail_type == 'Tag Change on Resource':
        log_group_arn = event['resources'][0]
        log_group_name = log_group_arn.split(":")[-1]
        print(f"{log_group_name} is tagged with {tag} = {tag_value}")

        logs_client = boto3.client("logs")

        if tag_value == opt_in:
            response = logs_client.put_subscription_filter(
                logGroupName=log_group_name,
                filterName=filter_name,
                filterPattern=filter_pattern,
                destinationArn=destination_arn,
                roleArn=role_arn
            )

            print(f"{filter_name} subscription filter added to {log_group_name}")

        elif tag_value == opt_out:
            response = logs_client.delete_subscription_filter(
                logGroupName=log_group_name,
                filterName=filter_name
            )

            print(f"{filter_name} subscription filter removed from {log_group_name}")

        else:
            print("no change")
