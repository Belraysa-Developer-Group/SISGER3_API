import { Router } from 'express';
import { getContenedoresByMes, getContenedoresById } from '../../controllers/contenedor.controller';

const router = Router()

router.get('/:id', getContenedoresById)
router.get('/mes/:idMes', getContenedoresByMes)

export default router