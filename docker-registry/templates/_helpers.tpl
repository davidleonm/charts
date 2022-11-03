{{/*
Expand the name of the chart.
*/}}
{{- define "docker-registry.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "docker-registry.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "docker-registry.labels" -}}
helm.sh/chart: {{ include "docker-registry.chart" . }}
{{ include "docker-registry.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "docker-registry.selectorLabels" -}}
app.kubernetes.io/name: {{ include "docker-registry.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
