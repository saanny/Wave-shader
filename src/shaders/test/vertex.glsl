uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;
uniform vec2 uFrequency;
uniform float uTime;


attribute vec3 position;
attribute float aRandom;
attribute vec2 uv;
varying float vRandom;
varying float vTime;
varying vec2 vUv;
varying float vElevation;
void main()
{
     vec4 modelPosition = modelMatrix * vec4(position , 1.0 );
     float elevation =  cos(modelPosition.x * uFrequency.y - uTime  ) * 0.1;
      elevation += sin(modelPosition.y * uFrequency.y ) * 0.1;
      
      modelPosition.z += elevation ;
      // modelPosition.y += aRandom * 0.1 ;
     vec4 viewPosition = viewMatrix * modelPosition ;
     vec4 projectionPosition = projectionMatrix * viewPosition;
      gl_Position = projectionPosition ;

      vRandom = aRandom;
      vTime = uTime;
      vUv = uv;
      vElevation = elevation;
}
  