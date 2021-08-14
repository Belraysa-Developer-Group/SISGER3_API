import { Router } from 'express';
import { sendBulkMail } from '../../controllers/mail/delivery.controller';


const router = Router()

router.post('/notify-all', sendBulkMail )

export default router