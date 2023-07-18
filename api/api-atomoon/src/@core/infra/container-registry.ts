

import { Container } from 'inversify'
import { ProductAxiosGateway } from './gateways'
import { ListProductsUseCase } from '../application/use-cases/product/list-products'
import { AuthenticateUserUseCase, CreateUserUseCase, DeleteUserUseCase, ListUsersUseCase } from '../application/use-cases/user/index'
import { UserRepositoryMongo } from './gateways/user-mongodb.gateway'

import { api } from './api'
import { mongodb } from './mongo'
import { GetUserInformationUserCase } from '../application/use-cases/user/recoveryinfo-user'

export const Registry = {
    // ## Adapters
    AxiosAdapter: Symbol.for('AxiosAdapter'),
    MongoAdapter: Symbol.for('MongoAdapter'),

    // ## Gateways
    ProductGateway: Symbol.for('ProductGateway'),
    UserGateway: Symbol.for('UserGateway'),

    // ## Use Cases
    ListProductsUseCase: Symbol.for('ListProductsUseCase'),
    ListUsersUseCase: Symbol.for('ListUsersUseCase'),

    CreateUserUseCase: Symbol.for('CreateUserUseCase'),
    DeleteUserUseCase: Symbol.for('DeleteUserUseCase'),
    AuthenticateUserUseCase: Symbol.for('AuthenticateUserUseCase'),
    GetUserInformationUserCase: Symbol.for('GetUserInformationUserCase'),
    GetProductUseCase: Symbol.for('GetProductUseCase')
}

export const container = new Container()

//########## HTTP
container.bind(Registry.AxiosAdapter).toConstantValue(api)
container.bind(Registry.MongoAdapter).toConstantValue(mongodb)

//########## GATEWAYS
container.bind(Registry.ProductGateway).toDynamicValue((context) => {
    return new ProductAxiosGateway(context.container.get(Registry.AxiosAdapter))
})
container.bind(Registry.UserGateway).toDynamicValue((context) => {
    return new UserRepositoryMongo(context.container.get(Registry.MongoAdapter))
})

//########## USE CASES
// Product
container.bind(Registry.ListProductsUseCase).toDynamicValue((context) => {
    return new ListProductsUseCase(context.container.get(Registry.ProductGateway))
})
container.bind(Registry.GetProductUseCase).toDynamicValue((context) => {
    return new ListProductsUseCase(context.container.get(Registry.ProductGateway))
})
// User
container.bind(Registry.ListUsersUseCase).toDynamicValue((context) => {
    return new ListUsersUseCase(context.container.get(Registry.UserGateway))
})

container.bind(Registry.CreateUserUseCase).toDynamicValue((context) => {
    return new CreateUserUseCase(context.container.get(Registry.UserGateway))
})

container.bind(Registry.DeleteUserUseCase).toDynamicValue((context) => {
    return new DeleteUserUseCase(context.container.get(Registry.UserGateway))
})

container.bind(Registry.AuthenticateUserUseCase).toDynamicValue((context) => {
    return new AuthenticateUserUseCase(context.container.get(Registry.UserGateway))
})

container.bind(Registry.GetUserInformationUserCase).toDynamicValue((context) => {
    return new GetUserInformationUserCase(context.container.get(Registry.UserGateway))
})