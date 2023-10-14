import { createClient } from 'redis';

export type RedisClientType = ReturnType<typeof createClient>;

export class CustomRedisClient {
  static _client: RedisClientType;

  static async get(): Promise<RedisClientType> {
    if (!this._client) {
      console.log(`APP_ENV: ${process.env.APP_ENV}`);
      console.log(`APP_ENV: ${process.env.REDIS_PORT}`);
      const host = process.env.REDIS_HOST || 'localhost';
      const port = process.env.REDIS_PORT || 6379;
      const url = `redis://${host}:${port}`;
      this._client = createClient({
        url,
      });

      this._client.on('error', (err) => {
        console.error(`onError: ${JSON.stringify(err)}`);
        throw err;
      });

      this._client.on('ready', () => {
        console.debug(`ready`);
      });

      this._client.on('connect', () => {
        console.debug(`Redis connected, url: ${url}`);
      });

      await this._client.connect();
    }

    return this._client;
  }
}
