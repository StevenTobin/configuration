local jaeger = (import 'jaeger-mixin/mixin.libsonnet');

(import 'github.com/observatorium/deployments/components/jaeger-collector.libsonnet') + {
  jaeger+:: {
    namespace:: 'observatorium',
    image:: 'jaegertracing/all-in-one:1.14.0',

    prometheusRule: {
      apiVersion: 'monitoring.coreos.com/v1',
      kind: 'PrometheusRule',
      metadata: {
        name: 'observatorium-jaeger',
        labels: {
          prometheus: 'app-sre',
          role: 'alert-rules',
        },
      },
      spec: jaeger.prometheusAlerts,
    },
  },
}
