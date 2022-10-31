{{/*
Expand the name of the chart.
*/}}
{{- define "jenkins-python-slave.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "jenkins-python-slave.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "jenkins-python-slave.labels" -}}
helm.sh/chart: {{ include "jenkins-python-slave.chart" . }}
{{ include "jenkins-python-slave.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "jenkins-python-slave.selectorLabels" -}}
app.kubernetes.io/name: {{ include "jenkins-python-slave.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
