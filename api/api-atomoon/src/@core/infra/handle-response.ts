
import { NextApiResponse } from "next/types";

export function handleResponse(typeRes: any, res: NextApiResponse) {
    return res.status(typeRes.statusCode).json({
        success: typeRes.success,
        ...typeRes.response,
    })
}