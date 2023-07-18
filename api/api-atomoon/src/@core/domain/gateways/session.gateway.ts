import { Session } from '../entities';

export interface SessionGateway {
    create(session: Session): Promise<Session>;
    refresh(session: Session): Promise<Session>;
    delete(session: Session): Promise<Session>;
}