import argparse
import json
import html
import logging
from queue import Queue
from collections.abc import Iterator
from contextlib import contextmanager
from ods_stream_processing.utils.spark import spark_session
from ods_stream_processing.stream.stream_config import create_stream_config
from ods_stream_processing.stream.stream_types import ApplicationContext, ApplicationState


logger = logging.getLogger(__name__)


@contextmanager
def application_context() -> Iterator:
    """
    Create application context for stream pipeline.
    
    Parse stream pipeline arguments and stream batch configuration instance.
    """
    logging.basicConfig(level=logging.INFO)

    parser = argparse.ArgumentParser()
    parser.add_argument("user_id", help="User Id")
    parser.add_argument("workload_password", help="Workload password of the user")
    parser.add_argument("generic_vars", help="Generic variables")
    parser.add_argument("job_vars", help="Job variables")
    parser.add_argument("dag_pipeline_args", help="Dag pipeline variables")

    args = parser.parse_args()

    user_id = html.unescape(args.user_id)
    workload_password = html.unescape(args.workload_password)
    generic_args = json.loads(html.unescape(args.generic_vars))
    job_args = json.loads(html.unescape(args.job_vars))
    dag_pipeline_args = json.loads(html.unescape(args.dag_pipeline_args))

    conf = create_stream_config(
        generic_args, job_args, dag_pipeline_args,
        user_id, workload_password
    )

    with spark_session(conf.pipeline_task_id, generic_args, job_args) as spark:
        ctx = ApplicationContext(
            conf,
            spark,
            generic_args,
            job_args,
            dag_pipeline_args,
            ApplicationState(Queue(3), True)
        )
        yield ctx

        