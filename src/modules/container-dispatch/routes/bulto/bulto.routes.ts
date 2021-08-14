import { Router } from 'express';
import { updateBultoById, getBultoById } from '../../controllers/bulto.controller';


const router = Router()

router.get('/:id', getBultoById)
router.put('/:id', updateBultoById)


export default router