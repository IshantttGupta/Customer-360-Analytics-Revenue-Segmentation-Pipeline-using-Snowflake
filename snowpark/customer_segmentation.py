
import os
from snowflake.snowpark import Session
from snowflake.snowpark.functions import col, when


def create_customer_segments(
    session: Session,
    source_table: str = 'analytics.customer_360',
    target_table: str = 'analytics.customer_360_segmented',
    high_threshold: float = 5000.0,
    medium_threshold: float = 1000.0,
):
    """Create a customer segment column and persist to `target_table`.

    Segments: High, Medium, Low based on lifetime value thresholds.
    """
    df = session.table(source_table)
    segmented = df.with_column(
        'customer_segment',
        when(col('lifetime_value') >= high_threshold, 'High')
        .when(col('lifetime_value') >= medium_threshold, 'Medium')
        .otherwise('Low')
    )
    segmented.write.save_as_table(target_table, mode='overwrite')
    return segmented


def _build_session_from_env():
    """Build a Snowpark Session from environment variables.

    Required environment variables (examples):
      SNOWFLAKE_ACCOUNT, SNOWFLAKE_USER, SNOWFLAKE_PASSWORD,
      SNOWFLAKE_WAREHOUSE, SNOWFLAKE_ROLE, SNOWFLAKE_DATABASE, SNOWFLAKE_SCHEMA

    This helper avoids committing credentials in code. You can also use a
    connection file or a secrets manager and adapt this function accordingly.
    """
    cfg = {
        'account': os.environ.get('SNOWFLAKE_ACCOUNT'),
        'user': os.environ.get('SNOWFLAKE_USER'),
        'password': os.environ.get('SNOWFLAKE_PASSWORD'),
        'role': os.environ.get('SNOWFLAKE_ROLE'),
        'warehouse': os.environ.get('SNOWFLAKE_WAREHOUSE'),
        'database': os.environ.get('SNOWFLAKE_DATABASE'),
        'schema': os.environ.get('SNOWFLAKE_SCHEMA'),
    }
    cfg = {k: v for k, v in cfg.items() if v}
    return Session.builder.configs(cfg).create()


if __name__ == '__main__':
    print('Running customer segmentation example...')
    try:
        session = _build_session_from_env()
    except Exception as e:
        raise SystemExit(
            'Failed to create Snowpark Session. Set connection env vars and try again: ' + str(e)
        )

    try:
        create_customer_segments(session)
        print('Customer segmentation table created: analytics.customer_360_segmented')
    finally:
        try:
            session.close()
        except Exception:
            pass

    
