import { UserGateway } from "@/@core/domain/gateways"
import { User } from "@/@core/domain/entities"

export class DeleteUserUseCase {
    constructor(private userGateway: UserGateway) { }

    execute(data: User): Promise<boolean> {
        return this.userGateway.delete(data)
    }
}