import { BadRequestError, InternalServerError, SuccessRequest } from '../../../@core/application/responses'

import { CreateUserUseCase, ListUsersUseCase } from '@/@core/application/use-cases/user'
import { container, Registry } from '@/@core/infra/container-registry'
import type { NextApiRequest, NextApiResponse } from 'next'
import { handleResponse } from '@/@core/infra/handle-response'
import { User } from '@/@core/domain/entities/User'
import { AuthenticateUserUseCase } from '@/@core/application/use-cases/user/'

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
    const body = req.body
    console.log(body)

    try {
        // POST /api/users/login 
        if (req.method == 'POST')
            return await logarUsuario(req, res)
    } catch (error) {
        return handleResponse(error || new InternalServerError('Erro interno do servidor'), res)
    }

    return handleResponse(new BadRequestError('Método não suportado'), res)
}

async function logarUsuario(req: NextApiRequest, res: NextApiResponse) {
    if (!req.body.email || !req.body.password) {
        return new BadRequestError('Email e senha são obrigatórios')
    }

    const loginUseCase = container.get<AuthenticateUserUseCase>(Registry.AuthenticateUserUseCase)
    const token = await loginUseCase.execute({ email: req.body.email, password: req.body.password})

    return res.status(200).json({
        token: token,
    })
}