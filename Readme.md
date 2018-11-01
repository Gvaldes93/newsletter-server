 # Newsletter and push notification server
 ##### API:
  __/api/newsletters__ - GET
  returns an object:
   ```
   {
      1: {
        'id': 1,
        'title': 'Housing',
        'complete': false
      },
      2: {
        'id': 2,
        'title': 'Sports',
        'complete': false
      },
      3: {
        'id': 3,
        'title': 'Locals',
        'complete': false
      }
  }
  ```
  
  __/api/notifications__ - GET
  post a push subscription object (https://developer.mozilla.org/en-US/docs/Web/API/PushSubscription)
  
  __/api/newsletter__ -POST 
  trigger the server to send push notification to subscribers
  
 `docker build -t web-app .`
 
 ##### Create vapid keys
 `npm install web-push -g` and run `web-push generate-vapid-keys --json` from the result extract the `publicKey` and `privateKey`
  
 Run server:
 `docker run -p 9000:9000  --env WEB_PUSH_PUBLIC_KEY={privateKey} --env WEB_PUSH_PRIVATE_KEY={publicKey} -d web-app` 


#### client apps
For a client app to become a subscriber of the server so it receives push notifications it needs to provide the previously created
__publicKey__ to the PUSH API - PushManager.subscribe() method as described in: https://developer.mozilla.org/en-US/docs/Web/API/PushManager/subscribe

#### Alternatively pull from Docker hub
to pull run 
`docker pull germanvs/newsletter-server`
and run server with: 
`docker run -p 9000:9000  --env WEB_PUSH_PUBLIC_KEY={privateKey} --env WEB_PUSH_PRIVATE_KEY={publicKey} -d germanvs/newsletter-server`
