import { Router } from 'express';

// Routes
import recipientsRoutes from './recipients/recipients.routes'




const router = Router()



router.use('/api/recipients', recipientsRoutes)





export default router;