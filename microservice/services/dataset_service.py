"""."""

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import logging

from microservice.generated_pb2 import dataset_pb2


class DatasetServicer(dataset_pb2.BetaDatasetServicer):

    def CreateDataset(self, request, context):
        logging.debug('Creating Dataset')
        logging.debug(request.name)
        return dataset_pb2.DatasetReply(id='102234', name='fixed name')

    def GetDataset(self, request, context):
        logging.debug('Getting Dataset')
        logging.debug(request.id)
        return dataset_pb2.DatasetReply(id=request.id, name='fixed name')
