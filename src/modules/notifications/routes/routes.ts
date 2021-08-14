import { Router } from 'express';

// Routes
import recipientsRoutes from './recipients/recipients.routes'
// import configRoutes from './mail/config.routes'
import deliveryRoutes from './mail/delivery.routes'




const router = Router()



router.use('/api/recipients', recipientsRoutes)
// router.use('/api/config', configRoutes)
router.use('/api/mail', deliveryRoutes)





export default router;