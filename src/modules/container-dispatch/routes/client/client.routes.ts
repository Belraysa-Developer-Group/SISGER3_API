import { Router } from 'express';
import { getClientById } from '../../controllers/client.controller';

const router = Router()

router.get('/:id', getClientById)


export default router