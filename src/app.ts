import expres,{ Application } from 'express';
import cors from 'cors';
import morgan from 'morgan';
import ContainerDispatchRoutes from './modules/container-dispatch/routes/routes'
import NotificatiosRoutes from './modules/notifications/routes/routes'
import { errorHandler } from './middlewares/error-handler';

export class App {
    private app: Application;

    constructor( private port?:number | string) {
        this.app = expres();
        this.setting()
        this.middlewares()
        this.routes()
    }

    setting() {
        this.app.set('port', this.port || 3000)
    }

    middlewares() {
        this.app.use(morgan('dev'))
        this.app.use(cors())
        this.app.use(expres.json())
        this.app.use(errorHandler);
    }

    routes() {
        this.app.use(ContainerDispatchRoutes)
        this.app.use(NotificatiosRoutes)

    }

    async listen () {
        await this.app.listen(this.app.get('port'))
        console.log(`Server on port ${this.app.get('port')}`)
    }
    
}
