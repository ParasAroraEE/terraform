import boto3
import json
import logging
import pandas as pd
from pathlib import Path

logger = logging.getLogger()
logger.setLevel(logging.INFO)

base_tmp_path = "/tmp/"
source_bucket = 's3-bucket-name'




def lambda_handler(event, context):
    
    source_key = "data/sample-file.csv"
    filename = Path(source_key).name
        
        
    s3 = boto3.client('s3')
    local_file_path = f'{base_tmp_path}{filename}'
    try:
        s3.download_file(source_bucket, source_key, local_file_path)
        logger.info(f'Downloaded file : {source_key} locally at path : {local_file_path}')
    except Exception as e:
        logger.error(e)
        return

    df = pd.read_csv(local_file_path)
    logger.info(f"Total Rows in CSV : {df.shape[0]}")
        
    
    return {
        'statusCode': 200,
        'body': json.dumps('Process completed')
    }
