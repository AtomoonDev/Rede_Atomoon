import jwt, { GetPublicKeyOrSecret, Secret } from 'jsonwebtoken';

interface TokenPayload {
    id: string
    role: string
}

interface DecodedToken {
    id: string
    role: string
    iat: number
    exp: number
}

export function generateToken(payload: TokenPayload): string {
    return jwt.sign(payload, process.env.JWT_SECRET as Secret, { expiresIn: 60 * 60 * 1 });
}


export function verifyToken(token: string):  DecodedToken | null | void {
    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET as Secret | GetPublicKeyOrSecret)
        return decoded
    } catch (err) {
        return null;
    }
}
