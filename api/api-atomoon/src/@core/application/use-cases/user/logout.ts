import { UserGateway } from "@/@core/domain/gateways"

export interface ILogoutDTO {
    readonly id: string
}

export class LogoutUseCase {
    constructor(private userGateway: UserGateway) { }

    execute(data: ILogoutDTO): Promise<void> {
        return this.userGateway.logOut(data.id)
    }
}