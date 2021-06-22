import { Router } from 'express';

// Routes
import annoRoutes from './anno/anno.routes'
import contenedorRoutes from './contenedor/contenedor.routes'



const router = Router()



router.use('/api/anno', annoRoutes)
router.use('/api/contenedor', contenedorRoutes)




export default router;