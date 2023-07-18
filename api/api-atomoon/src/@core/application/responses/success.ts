export class SuccessResponse {
    sucesss = true
    title = 'Success'
    status = 200
    message: any
    response: Object

    constructor(message: any) {
        this.message = message
        this.response = {
            message
        }
    }
}
