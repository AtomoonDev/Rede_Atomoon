import { UserGateway } from "@/@core/domain/gateways"
import { User } from "@/@core/domain/entities"

export class ListUsersUseCase {
    constructor(private userGateway: UserGateway) { }

    execute(): Promise<User[]> {
        return this.userGateway.findAll()
    }
}