import { InternalServerError, UnauthorizedError, SuccessResponse } from '@/@core/application/responses'
import { GetUserInformationUserCase } from '@/@core/application/use-cases/user/recoveryinfo-user'
import { container, Registry } from '@/@core/infra/container-registry'
import { handleResponse } from '@/@core/infra/handle-response'

import type { NextApiRequest, NextApiResponse } from 'next'

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
    const body = req.body
    console.log(body)

    try {
        // POST /api/me
        if (req.method == 'POST') {
            return await recoverUserInformation(req, res)
        }
    }
    catch (error) {
        return handleResponse(error || new InternalServerError('Erro interno do servidor'), res)
    }

    return res.status(400).json({

    })
}

async function recoverUserInformation(req: NextApiRequest, res: NextApiResponse) {
    const token = req.headers?.authorization || ''
    const hasAuthorizationToken = token.startsWith('Bearer ')
    if (!hasAuthorizationToken)
        throw new UnauthorizedError('Usuário não autenticado')

    const getUserInformationUserCase = container.get<GetUserInformationUserCase>(Registry.GetUserInformationUserCase)
    const userInfo = await getUserInformationUserCase.execute(token.replace('Bearer ', ''))

    return res.status(200).json({
        userInfo
    })
}