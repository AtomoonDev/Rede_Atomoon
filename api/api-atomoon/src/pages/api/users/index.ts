import { BadRequestError, InternalServerError, UnauthorizedError, SuccessRequest } from '../../../@core/application/responses'

import { CreateUserUseCase, ListUsersUseCase } from '@/@core/application/use-cases/user'
import { container, Registry } from '@/@core/infra/container-registry'
import type { NextApiRequest, NextApiResponse } from 'next'
import { handleResponse } from '@/@core/infra/handle-response'
import { User } from '@/@core/domain/entities/User'

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
    const body = req.body
    console.log(body)

    try {
        // GET /api/users 
        if (req.method == 'GET') 
            return await listarUsuarios(req, res)
        
        // POST /api/users 
        if (req.method == 'POST') 
            return await incluirUser(req, res)
    } catch (error) {
        return handleResponse(error || new InternalServerError('Erro interno do servidor'), res)
    }

    return handleResponse(new BadRequestError('Método não suportado'), res)
}

async function listarUsuarios(req: NextApiRequest, res: NextApiResponse) {
    const hasAuthorizationToken = req.headers?.authorization?.startsWith('Bearer: ')
    if(!hasAuthorizationToken) {
        throw new UnauthorizedError('Usuário não autenticado')
    }

    const listUsersUseCase = container.get<ListUsersUseCase>(Registry.ListUsersUseCase)
    const users = await listUsersUseCase.execute()

    return res.status(200).json({
        users: users.map((user: User) => user.toJSON()),
    })
}


async function incluirUser(req: NextApiRequest, res: NextApiResponse) {
    const CreateUserUseCase = container.get<CreateUserUseCase>(Registry.CreateUserUseCase)
    const userHasBeenCreated = await CreateUserUseCase.execute(req.body)
    if (!userHasBeenCreated) {
        throw new BadRequestError('Usuário não cadastrado')
    }

    return res.status(200).json({
        success: true,
        message: 'Usuário cadastrado com sucesso',
    })
    //return new SuccessRequest('Usuário cadastrado com sucesso')
}
