import { Router } from 'express';
import { getContenedoresByMes } from '../../controllers/contenedor.controller';

const router = Router()

router.get('/:idMes', getContenedoresByMes)

export default router