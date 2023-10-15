import RedisClient from '@redis/client/dist/lib/client';
import { CustomRedisClient, RedisClientType } from './custom-redis.client';

export class MemberRepository {
  private readonly PREFIX = 'member';
  private readonly _client;

  constructor(client: Promise<RedisClientType>) {
    this._client = client;
  }

  async getMember(id: string): Promise<string | null> {
    return (await this._client).get(`${this.PREFIX}:${id}`);
  }

  async setMember(id: string) {
    (await this._client).set(`${this.PREFIX}:${id}`, `Hello, member ${id}`);
  }
}

export const memberRepository = new MemberRepository(CustomRedisClient.get());
