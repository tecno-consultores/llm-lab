# N8N Expressions Reference

* Generic UTC date and time (ISO-8601):

  ```javascript
  {{ new Date().toISOString() }}
  ```

* Localized date and time (`es-VE`):

  ```javascript
  {{ new Date().toLocaleString('es-VE') }}
  ```

* Luxon current timestamp:

  ```javascript
  {{ $now }}
  ```

* Current timestamp in Epoch milliseconds:

  ```javascript
  {{ Date.now() }}
  ```

* Query object from input JSON:

  ```javascript
  {{ $json.query }}
  ```

* AI Agent tool parameter (`$fromAI`):

  ```javascript
  {{ $fromAI("name", "The commenter's name", "string", "Jane Doe") }}
  ```

* OpenWebUI webhook chat input:

  ```javascript
  {{ $json.body.chatInput }}
  ```

* Pseudo-random integer *(for non-security identifiers only; prefer `crypto.randomUUID()` when cryptographic randomness is required)*:

  ```javascript
  {{ parseInt(Math.random() * 10000000000000000, 10) }}
  ```
