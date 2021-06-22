import expres,{ Application } from 'express';
import cors from 'cors';
import morgan from 'morgan';
import routes from './routes/routes'

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
    }

    routes() {
        this.app.use(routes)

    }

    async listen () {
        await this.app.listen(this.app.get('port'))
        console.log(`Server on port ${this.app.get('port')}`)
    }
    
}
