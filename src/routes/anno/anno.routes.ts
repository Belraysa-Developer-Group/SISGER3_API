import { Request, Response, Router } from 'express';
import { getAnnos } from '../../controllers/anno.controller';

const router = Router()

router.get('/', getAnnos)

export default router