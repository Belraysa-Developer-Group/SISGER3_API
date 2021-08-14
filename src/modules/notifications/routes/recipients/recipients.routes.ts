import { Request, Response, Router } from 'express';
import { getRecipientsByContenedor } from '../../controllers/recipients/recipients.controller';

const router = Router()

router.get('/contenedor/:id', getRecipientsByContenedor)

export default router