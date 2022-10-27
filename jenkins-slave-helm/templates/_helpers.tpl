{{/*
Expand the name of the chart.
*/}}
{{- define "jenkins-slave-helm.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "jenkins-slave-helm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "jenkins-slave-helm.labels" -}}
helm.sh/chart: {{ include "jenkins-slave-helm.chart" . }}
{{ include "jenkins-slave-helm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "jenkins-slave-helm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "jenkins-slave-helm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
