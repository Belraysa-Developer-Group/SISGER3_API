import { Router } from 'express';

// Routes
import annoRoutes from './anno/anno.routes'
import contenedorRoutes from './contenedor/contenedor.routes'
import clientRoutes from './client/client.routes'



const router = Router()



router.use('/api/anno', annoRoutes)
router.use('/api/client', clientRoutes)
router.use('/api/contenedor', contenedorRoutes)




export default router;